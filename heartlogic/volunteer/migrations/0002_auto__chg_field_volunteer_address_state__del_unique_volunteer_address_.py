# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Removing unique constraint on 'Volunteer', fields ['blood_grp']
        db.delete_unique('volunteer_volunteer', ['blood_grp_id'])

        # Removing unique constraint on 'Volunteer', fields ['address_state']
        db.delete_unique('volunteer_volunteer', ['address_state_id'])


        # Changing field 'Volunteer.address_state'
        db.alter_column('volunteer_volunteer', 'address_state_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['database.State']))

        # Changing field 'Volunteer.blood_grp'
        db.alter_column('volunteer_volunteer', 'blood_grp_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['bloodgroup.BloodGroup']))

    def backwards(self, orm):

        # Changing field 'Volunteer.address_state'
        db.alter_column('volunteer_volunteer', 'address_state_id', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['database.State'], unique=True))
        # Adding unique constraint on 'Volunteer', fields ['address_state']
        db.create_unique('volunteer_volunteer', ['address_state_id'])


        # Changing field 'Volunteer.blood_grp'
        db.alter_column('volunteer_volunteer', 'blood_grp_id', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['bloodgroup.BloodGroup'], unique=True))
        # Adding unique constraint on 'Volunteer', fields ['blood_grp']
        db.create_unique('volunteer_volunteer', ['blood_grp_id'])


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
            'address_state': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['database.State']"}),
            'address_street_one': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'address_street_two': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'alt_phone_no': ('django.db.models.fields.IntegerField', [], {'blank': 'True'}),
            'blood_grp': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['bloodgroup.BloodGroup']"}),
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