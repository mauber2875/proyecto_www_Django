# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2017-12-14 15:32
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('deporte', '0004_actividades_estado'),
    ]

    operations = [
        migrations.AddField(
            model_name='evento',
            name='tipo_deporte',
            field=models.CharField(default='Futbol', max_length=200),
        ),
    ]