# Generated by Django 4.0.6 on 2023-05-05 23:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sms', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='amt',
            field=models.CharField(default=0, max_length=1000),
            preserve_default=False,
        ),
    ]
