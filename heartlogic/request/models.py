from django.db import models
from bankshospitals.models import Hospital
from bankshospitals.models import Bank
from bloodgroups.models import BloodGroup
# Create your models here.

class Request(models.Model):
	id = models.CharField(max_length = 50)#Id to be generated in a view
	request_added_by_bank = models.OneToOneField(Bank)
	request_added_by_hospital = models.OneToOneField(Hopital)
	blood_groups = models.OneToOneField(BloodGroup)
	units_of_blood = models.IntegerField()#Change it with relations if possible
	fullfilled = models.BooleanField(default = False)
	fullfilled_by = models.ForeignKey(BankHospital)
	priority_level = models.IntegerField()
	def __unicode__(Self):
		return self.id