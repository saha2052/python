# Generated by Django 3.2.9 on 2022-03-01 13:24

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0008_alter_dataset_set_type'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='datasettypecharacteristic',
            name='c_dst_characteristic',
        ),
        migrations.RemoveField(
            model_name='datasettypecharacteristic',
            name='dstc_datasettype',
        ),
        migrations.DeleteModel(
            name='DataSetType',
        ),
        migrations.DeleteModel(
            name='DataSetTypeCharacteristic',
        ),
    ]
