from rest_framework import serializers

from receipt.models import Permalink as PermalinkModel
from receipt.models import Receipt as ReceiptModel


class ReceiptSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReceiptModel
        fields = ["user", "date", "content", "outlay", "desc", "create_date"]


class PermalinkSerializer(serializers.ModelSerializer):
    class Meta:
        model = PermalinkModel
        fields = ["url", "refer_to", "end_date"]
