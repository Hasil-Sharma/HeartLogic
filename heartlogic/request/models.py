from django.db import models
from bankhospital.models import Bank
from bloodgroup.models import BloodGroup
# Create your models here.

class Request(models.Model):
	uid = models.CharField(max_length = 50)#Id to be generated in a view
	request_added_by_bank = models.OneToOneField(Bank)
	blood_groups = models.OneToOneField(BloodGroup)
	units_of_blood_req = models.IntegerField()#Change it with relations if possible
	units_of_blood_given = models.CharField(max_length =100) # Pickling of the dictionary
	fullfiled = models.BooleanField(default = False)
	fullfiled_by = models.ForeignKey(Bank, related_name = 'request_fullfiling_banks')
	priority_level = models.IntegerField()
	def __unicode__(self):
		return self.uid