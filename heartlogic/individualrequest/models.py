'''
Created on 15-Mar-2013

@author: Aayush
'''
from django.db import models
from bankhospital.models import Bank
from bloodgroup.models import BloodGroup
# Create your models here.

class IndividualRequest(models.Model): 
    uid = models.CharField(max_length = 50)
    name = models.CharField(max_length = 50)
    contact_no = models.IntegerField()
    hospital_where_required = models.ForeignKey(Bank, limit_choices_to = {'type': 1})#Hospital to be defined
    blood_group = models.ForeignKey(BloodGroup)
    