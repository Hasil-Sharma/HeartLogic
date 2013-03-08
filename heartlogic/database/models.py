from django.db import models

# Create your models here.
    
class PagesContent(models.Model):
    name = models.CharField('Page Name', max_length=50)
    link = models.CharField('Page Link', max_length=50, blank = True)
    content=models.TextField('Put content of page here')
    def __unicode__(self):
        return self.link
    
    class Meta:
        verbose_name_plural = "Pages Content"
        
class State(models.Model):
    state = models.CharField(max_length=100)
    def __unicode__(self):
        return self.state