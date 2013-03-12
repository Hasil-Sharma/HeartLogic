from django.db import models
from bankhospital.models import Bank
# Create your models here.

class IndividualRequest(models.Model):
    #Request coming through website !!!
    #Confirm it once 
    uid = models.CharField(max_length = 50)
    name = models.CharField(max_length = 50)
    contact_no = models.CharField(max_length = 50)
    hospital_where_required = models.OneToOneField(Bank)#Hospital to be defined
    individual_request_fullfiled = models.BooleanField(default = False)
    fullfiled_by = models.ForeignKey(Bank, related_name = 'individual_request_fullfiling_banks')