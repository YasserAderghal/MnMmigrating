from django.shortcuts import render
from .forms import UploadFileForm
from django.core.files.storage import FileSystemStorage
from django.conf import settings

from django.http import HttpResponse, Http404
from converter import converter
import os
# Create your views here.

#def home(request):
#    return render(request , 'home/home.html', {"home": "Hello world"})

def home(request):

            

    return render(request, 'home/home.html', {'form': "test"})

def tables(request):
    
    if request.method == 'POST':
        if request.FILES["myfile"] :
            myfile = request.FILES['myfile']
            if str(myfile).split("/")[-1][-4:] == ".sql": 
                print("tata")
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                uploaded_file_url = fs.url(filename)

                tables, _ , _ , _ , _ = converter.statement_split(uploaded_file_url)


                return render(request, 'home/tables.html', {'tables': tables })

    return render(request, 'home/error.html', {'error': "Error"})

def show(request):

    if request.method == 'POST':
        checked_items = request.POST.getlist("item_checkbox")
        file = converter.run(checked_items)

    if file:
        return render(request, 'home/show.html', { 'succ': True,'file_download': file})


    return render(request, 'home/error.html', {'error': "show"})


def download(request, path):
    file_path = os.path.join(settings.MEDIA_ROOT, path)
    print(file_path)
    if os.path.exists(file_path):
        with open(file_path, 'rb') as fh:
            response = HttpResponse(fh.read(), content_type="application/zip")
            response['Content-Disposition'] = 'inline; filename=' + os.path.basename(file_path)
            return response
    raise Http404

def error_404_view(request, exception):
    return render(request,'home/error.html')

