# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Volunteer'
        db.create_table('volunteer_volunteer', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('uid', self.gf('django.db.models.fields.CharField')(max_length=10)),
            ('first_name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('last_name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('phone_no', self.gf('django.db.models.fields.IntegerField')()),
            ('alt_phone_no', self.gf('django.db.models.fields.IntegerField')(blank=True)),
            ('address_street_one', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('address_street_two', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('address_city', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('address_state', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['database.State'], unique=True)),
            ('address_pin', self.gf('django.db.models.fields.IntegerField')()),
            ('blood_grp', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['bloodgroup.BloodGroup'], unique=True)),
            ('last_time_donated', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('willing_again', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('volunteer', ['Volunteer'])


    def backwards(self, orm):
        # Deleting model 'Volunteer'
        db.delete_table('volunteer_volunteer')


    models = {
        'bloodgroup.bloodgroup': {
            'Meta': {'object_name': 'BloodGroup'},
            'blood_group': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'rh_factor': ('django.db.models.fields.CharField', [], {'max_length': '1'})
        },
        'database.state': {
            'Meta': {'object_name': 'State'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'volunteer.volunteer': {
            'Meta': {'object_name': 'Volunteer'},
            'address_city': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'address_pin': ('django.db.models.fields.IntegerField', [], {}),
            'address_state': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['database.State']", 'unique': 'True'}),
            'address_street_one': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'address_street_two': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'alt_phone_no': ('django.db.models.fields.IntegerField', [], {'blank': 'True'}),
            'blood_grp': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['bloodgroup.BloodGroup']", 'unique': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'last_time_donated': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'phone_no': ('django.db.models.fields.IntegerField', [], {}),
            'uid': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'willing_again': ('django.db.models.fields.BooleanField', [], {'default': 'False'})
        }
    }

    complete_apps = ['volunteer']