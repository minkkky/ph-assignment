# Generated by Django 4.1.5 on 2023-01-05 13:38

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name="Receipt",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("date", models.DateTimeField()),
                ("content", models.CharField(max_length=50)),
                ("outlay", models.IntegerField()),
                ("desc", models.CharField(blank=True, max_length=200)),
                ("create_date", models.DateTimeField(auto_now_add=True)),
                (
                    "user",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Permalink",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("encode", models.CharField(max_length=50)),
                ("end_date", models.DateTimeField()),
                (
                    "refer_to",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="receipt.receipt",
                    ),
                ),
            ],
        ),
    ]
