from django.db import models


class Receipt(models.Model):
    user = models.ForeignKey("user.User", on_delete=models.CASCADE)
    date = models.DateTimeField()
    content = models.CharField(max_length=50)
    outlay = models.IntegerField()
    desc = models.CharField(max_length=200, blank=True)
    create_date = models.DateTimeField(auto_now_add=True)


class Permalink(models.Model):
    url = models.URLField(max_length=200)
    refer_to = models.ForeignKey(Receipt, on_delete=models.CASCADE)
    end_date = models.DateTimeField()
