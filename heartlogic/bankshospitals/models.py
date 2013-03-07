from django.db import models

# Create your models here.
class Bank(models.Model):
	id = models.CharField(max_length=50)#This is a unique id for each and every hospital
	name = models.CharField(max_length=50)
	username = models.CharField(max_length=50)
	phone_no = models.IntegerField()
    address_street_one = models.CharField(max_length = 50)
    address_street_two = models.CharField(max_length = 50, blank = True)
    address_city = models.CharField(max_length = 50)
	address_state = models.CharField(max_length = 50)#Drop down by frontend
    address_pin = models.IntegerField(blank = True)
	#Blood Statistics
	def __unicode__(self):
		return self.name

class Hospital(models.Model):
	id = models.CharField(max_length = 50)
	name = models.CharField(max_length = 50)
    phone_no = models.IntegerField()
    address_street_one = models.CharField(max_length = 50)
    address_street_two = models.CharField(max_length = 50, blank = True)
    address_city = models.CharField(max_length = 50)
	address_state = models.CharField(max_length = 50)#Drop down by frontend
    address_pin = models.IntegerField()
	
	def __unicode__(self):
		return self.name

class Camps(models.Model):
	name = models.CharField(max_length = 50)
    phone_no = models.IntegerField()
	address_street_one = models.CharField(max_length = 50)
    address_street_two = models.CharField(max_length = 50, blank = True)
    address_city = models.CharField(max_length = 50)
	address_state = models.CharField(max_length = 50)
    address_pin = models.IntegerField()
    date = models.DateTimeField()
    camp_added_by = models.OneToOneField(Bank)
	
	def __unicode__(self):
		return self.camp_added_by