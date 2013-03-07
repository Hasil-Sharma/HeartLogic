from django.db import models

# Create your models here.

class BloodGroup(models.Model):
	blood_group = models.CharField(max_length=10)
	rh_factor = models.CharField(max_length=1)
	def __unicode__(Self):
		blood = self.blood_group + self.rh_factor
		return blood