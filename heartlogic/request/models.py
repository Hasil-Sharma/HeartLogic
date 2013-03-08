from django.db import models
from bankshospitals.models import Bank
from bloodgroups.models import BloodGroup
# Create your models here.

class Request(models.Model):
	uid = models.CharField(max_length = 50)#Id to be generated in a view
	request_added_by_bank = models.OneToOneField(Bank)
	blood_groups = models.CharField(max_length = 50)
	units_of_blood = models.IntegerField()#Change it with relations if possible
	fullfilled = models.BooleanField(default = False)
	fullfilled_by = models.CharField(max_length = 50)
	priority_level = models.IntegerField()
	def __unicode__(Self):
		return self.uid