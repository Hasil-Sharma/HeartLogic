from django.db import models
from bankshospitals.models import Hospital
# Create your models here.

class IndividualRequest(models.Model):
    #Request coming through website !!!
    #Confirm it once 
    uid = models.CharField(max_length = 50)
    name = models.CharField(max_length = 50)
    contact_no = models.CharField(max_length = 50)
    hospital_where_required = models.OneToOneField(Hospital)#Hospital to be defined
    individual_request_fullfilled = models.BooleanField(default = False)
    # fullfiled_by = models.OneToOneField()