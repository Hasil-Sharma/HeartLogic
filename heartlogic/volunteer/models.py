from django.db import models
from database.models import State
from bloodgroup.models import BloodGroup 
# Create your models here.
#TO BE DISPLAYE ON WEBSITE
class Volunteer(models.Model):
    # Vounteers who are willing as well as had donated blood in past , based on willing_again
    # field and they can register themselves. Later we can use tinymce for these fields.
    # A volunteer can only add a request for a single blood group at a time
    uid = models.CharField(max_length = 10)
    first_name = models.CharField(max_length = 50)
    last_name = models.CharField(max_length = 50)
    phone_no = models.IntegerField()
    alt_phone_no = models.IntegerField(blank= True)
    address_street_one = models.CharField(max_length = 50)
    address_street_two = models.CharField(max_length = 50)
    address_city = models.CharField(max_length = 50)
    address_state = models.OneToOneField(State)
    address_pin = models.IntegerField()
    blood_grp = models.OneToOneField(BloodGroup)
    last_time_donated = models.DateField()
    willing_again = models.BooleanField()
    
    def __unicode__(self):
        name = self.first_name +" "+ self.last_name
        return name