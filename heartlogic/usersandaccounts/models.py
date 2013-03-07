from django.db import models

# Create your models here.

class Accounts(models.Model):
    username = models.CharField(max_length = 50)
    password = models.CharField(max_length = 50)
	type = models.IntegerField()
	
	def __unicode__(self):
		return self.username