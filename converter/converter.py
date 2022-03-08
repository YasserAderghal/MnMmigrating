import os
import copy
from sql_metadata import Parser
import pickle

from zipfile import ZipFile
import time
import json
import re
import sys

def get_sql_from_file(filename):
    """
    Get the SQL instruction from a file

    :return: a list of each SQL query whithout the trailing ";"
    """

    # File did not exists
    if os.path.isfile(filename) is False:
        print("File load error : {}".format(filename))
        return os._exit(1)

    else:
        with open(filename, "r") as sql_file:
            # Split file in list
            ret = sql_file.read().split('--\n')
            # drop last empty entry
            #ret.pop()
            return ret



def statement_split(filename):

    # split file into list of statements
    file = PROJECT_PATH = os.path.abspath(os.path.dirname(__name__)) 
    print("Get sql statements from file ....")
    tempo = get_sql_from_file(file + filename)

    data = []
    tables = []
    foreign_key = []
    primary_key = []

    for r in tempo:

        if "INSERT" in r:
            r = r.replace("\n","")
            r = re.sub(r"----[^--]+--","",r) 
            data.append(r)

            r = r.split(" ")[2].replace("`","")
            tables.append(r)
            continue
        if "FOREIGN KEY" in r:
            r = r.replace("\n","")
            r = re.sub(r"----[^--]+--","",r) 
            r = re.findall('\`.*?\`',r)
            r = list(map(lambda x: x.replace("`","") , r))
            
            foreign_key.append(r)
            continue
        if "PRIMARY KEY" in r:
            r = r.replace("\n","")
            r = re.sub(r"----[^--]+--","",r) 
            primary_key.append(r)
            continue

    # split again if there with ");"

    dat = "  ".join(data)
    data = []
    dat = dat.split(");")
    dat.pop()

    for r in dat:
        r = re.sub(r"^-- ------------------------------------------------------  ","",r) 
        temp = " ".join((r,");"))
        data.append( temp )

    primary_key_data = []

    for key in primary_key:
        k = re.findall('\`.*?\`',key)
        k = list(map(lambda x: x.replace("`","") , k))
        primary_key_data.append(k[:2])

    # now we have two kind of statements INSERT VALUES AND ALTER FOREIGN KEYS

    foreign = []
    for k in foreign_key:
        if k[0] in  tables:
            foreign.append(k)

    render_table = []
    for tab in tables:
        temp = []
        fk = [ x for x in foreign_key if tab == x[0]]

        if fk :
            for f in fk:
                temp = [f[0], f[2], f[3], f[4]]
            render_table.append( temp)
        else:
            temp = [tab , '-','-','-']
            render_table.append( temp)


    data = get_dictionary_from_sql_statements(data)

    ## save data
    pickle.dump(data, open(file + "/media/data.pkl" , "wb") )
    ## save foreign keys
    pickle.dump( foreign, open(file + "/media/foreign_keys.pkl" , "wb"))
    ## save tables
    pickle.dump( tables, open(file + "/media/tables.pkl" , "wb"))


    return render_table , tables , data , foreign , primary_key_data


def get_dictionary_from_sql_statements(data):
    # Get values from insert and combine then with their attributes
    dict_tables = {}
    count = 0
    for r in data:
        key = Parser(r).columns
        row = Parser(r).values
        
        arr = []
        for i in list(zip(*[iter(row)]*len(key))):
            arr.append(dict(zip(key , i)))

        table_name = r.split(" ")[2].replace("`","")


        if table_name in dict_tables:
            dict_tables[table_name] += arr
        else:
            dict_tables[table_name] = arr
    
    return dict_tables

def run(tables_selected):
    file = PROJECT_PATH = os.path.abspath(os.path.dirname(__name__)) 
    
    dict_tables = pickle.load( open(file + "/media/data.pkl","rb") ) 
    foreign_key = pickle.load( open(file + "/media/foreign_keys.pkl","rb") ) 
    tables = pickle.load( open(file + "/media/tables.pkl","rb") ) 

    dict_table_cloned = copy.deepcopy(dict_tables)

    date = str(time.time()).split('.')[0]
    if len(tables_selected) == len(tables):

        for k in foreign_key:
            print("Joining all tables ... ")
            
            # left join
            for left in dict_table_cloned[k[0]]:
                arr = []

                arr = list(filter(lambda x:x[ k[4] ] == left[ k[2] ] , dict_tables[ k[3] ]))
                left[ k[3] ] = arr

            for left in dict_table_cloned[k[3]]:
                arr = []
                arr = list(filter(lambda x:x[ k[2] ] == left[ k[4] ] , dict_tables[ k[0] ]))
                left[ k[0] ] = arr

        # save all tables
        for k in dict_table_cloned:
            
            with open(f"{file}/media/{date}_{k}.json", "w") as f:
                print(f"{file}/media/{date}_{k}.json")
                f.write(json.dumps(dict_table_cloned[k], sort_keys=False, indent=4, separators=(',', ': ')))

    elif len(tables_selected) > 0 and len(tables_selected)<len(tables):

        for k in foreign_key:
                
            if k[0] in tables_selected:
                print("Joining selected tables ... ")
                
                # left join
                for left in dict_table_cloned[k[0]]:
                    arr = []

                    arr = list(filter(lambda x:x[ k[4] ] == left[ k[2] ] , dict_tables[ k[3] ]))
                    left[ k[3] ] = arr

            if k[3] in tables_selected:

                for left in dict_table_cloned[k[3]]:
                    arr = []
                    arr = list(filter(lambda x:x[ k[2] ] == left[ k[4] ] , dict_tables[ k[0] ]))
                    left[ k[0] ] = arr


        # save with ref
        for k in dict_table_cloned:
            with open(f"{file}/media/{date}_{k}.json", "w") as f:
                print(f"{file}/media/{date}_{k}.json")
                f.write(json.dumps(dict_table_cloned[k], sort_keys=False, indent=4, separators=(',', ': ')))

    else:
        print("no join")
        # save with ref
        for k in dict_table_cloned:
            with open(f"{file}/media/{date}_{k}.json", "w") as f:
                print(f"{file}/media/{date}_{k}.json")
                f.write(json.dumps(dict_table_cloned[k], sort_keys=False, indent=4, separators=(',', ': ')))

    zipObj = ZipFile(f'{file}/media/{date}_database.zip', 'w')

    files = [f for f in os.listdir(f"{file}/media/") if os.path.isfile(f"{file}/media/{f}")]

    abs_src = os.path.abspath(f"{file}/media/")
    for dirname, subdirs, files in os.walk(f"{file}/media/"):
        for filename in files:
            if filename.split("_")[0] == date and filename[-4:] == "json":
                absname = os.path.abspath(os.path.join(dirname, filename))
                arcname = absname[len(abs_src) + 1:]
                print ('zipping %s as %s' % (os.path.join(dirname, filename),arcname))
                zipObj.write(absname, arcname)


    zipObj.close()

    return f"{date}_database.zip" 
