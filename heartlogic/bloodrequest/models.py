from django.db import models
from bloodgroup.models import BloodGroup
# Create your models here.

class Request(models.Model):
	uid = models.CharField(max_length = 50)#Id to be generated in a view
	request_added_by_bank = models.CharField(max_length = 50)
	blood_groups = models.ForeignKey(BloodGroup)
	units_of_blood_req = models.IntegerField()#Change it with relations if possible
	units_of_blood_given = models.CharField(max_length =100, blank = True, null = True) # Pickling of the dictionary
	fullfiled = models.BooleanField(default = False)
	fullfiled_by = models.CharField(max_length = 50, blank = True, null = True)
	priority_level = models.IntegerField()
	def __unicode__(self):
		return self.uid