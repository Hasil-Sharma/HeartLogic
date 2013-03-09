from django.db import models
from bankhospital.models import Bank
# Create your models here.

class BloodGroup(models.Model):
	blood_group = models.CharField(max_length=10)
	rh_factor = models.CharField(max_length=1)
	
	
class Blood(models.Model):
	bank = models.OneToOneField(Bank)
	group = models.OneToOneField(BloodGroup)
	quantity = models.IntegerField()