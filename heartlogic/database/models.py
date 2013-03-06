from django.db import models
from django.core.files.storage import FileSystemStorage
import os

# Create your models here.

class PagesContent(models.Model):
    name = models.CharField('Page Name', max_length=50)
    link = models.CharField('Page Link', max_length=50, blank = True)
    content=models.TextField('Put content of page here')
    def __unicode__(self):
        return self.link
    class Meta:
        verbose_name_plural = "Pages Content"