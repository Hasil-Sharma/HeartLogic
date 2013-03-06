from django.db import models
from django.core.files.storage import FileSystemStorage
import os

# Create your models here.
class BloodGroups(models.Model):
    #Every blood group is uniquely identified by it's id(foreign key)
    blood_groups = models.CharField(max_length = 10)
    rh_factor = models.CharField(max_length = 2)
    
    def __unicode__(self):
        blood = self.blood_groups + self.rh_factor
        return blood
    
class PagesContent(models.Model):
    name = models.CharField('Page Name', max_length=50)
    link = models.CharField('Page Link', max_length=50, blank = True)
    content=models.TextField('Put content of page here')
    def __unicode__(self):
        return self.link
    
    class Meta:
        verbose_name_plural = "Pages Content"

# Create your models here.
class Volunteer(models.Model):
    # Vounteers who are willing as well as had donated blood in past , based on willing_again
    # field and they can register themselves. Later we can use tinymce for these fields.
    # A volunteer can only add a request for a single blood group at a time
    uid = models.CharField(max_length = 10)
    first_name = models.CharField(max_length = 50)
    last_name = models.CharField(max_length = 50)
    phone_no = models.IntegerField()
    Alt_phone_no = models.IntegerField()
    address_street_one = models.CharField(max_length = 50)
    address_street_two = models.CharField(max_length = 50)
    address_city = models.CharField(max_length = 50)
    address_pin = models.IntegerField()
    blood_grp = models.OneToOneField(BloodGroups)
    last_time_donated = models.DateField()
    willing_again = models.BooleanField()
    
    def __unicode__(self):
        name = self.first_name +" "+ self.last_name
        return name
    
class BankHospital(models.Model):
    id = models.CharField(max_length = 50)
    username = models.CharField(max_length = 50)
    #blood statistics
    
    
class Camps(models.Model):
    name = models.CharField(max_length = 50)
    phone_no = models.IntegerField()
    address_street_one = models.CharField(max_length = 50)
    address_street_two = models.CharField(max_length = 50)
    address_city = models.CharField(max_length = 50)
    address_pin = models.IntegerField()
    date = models.DateTimeField()
    camp_added_by = models.OneToOneField(BankHospital)
    
    
class Request(models.Model):
    #If a hospital is sending a request , can they ask for more than one type of blood group
    #in a single request ?
    #Can same request be added by two hospitals ?
    #Keep this option in editing of request about transferring of request
    id = models.CharField(max_length = 50)
    request_added_by = models.OneToOneField(BankHospital)
    blood_grp = models.CharField(max_length = 50) # Many to Many Field
    units_of_blood = models.IntegerField()
    fullfilled_or_not = models.BooleanField()
    fullfilled_by = models.ForeignKey(BankHospital)#Many to One Field
    #prioriy level
    #given_by_patient
    
class IndividualRequest(models.Model):
    #Request coming through website !!!
    #Confirm it once 
    uid = models.CharField(max_length = 50)
    name = models.CharField(max_length = 50)
    contact_no = models.CharField(max_length = 50)
    hospital_where_required = models.OneToOneField('Hospital')#Hospital to be defined
    individual_request_fullfilled = models.BooleanField()
    # fullfiled_by = models.OneToOneField()
    
class Accounts(models.Model):
    username = models.CharField(max_length = 50)
    password = models.CharField(max_length = 50)
    #type
    