# Generated by Django 3.2.9 on 2022-01-25 17:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='datasource',
            name='typeData',
            field=models.JSONField(default={}, verbose_name='Datasource Type Data'),
            preserve_default=False,
        ),
    ]
