from rest_framework import serializers

from receipt.models import Permalink as PermalinkModel
from receipt.models import Receipt as ReceiptModel


class ReceiptSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReceiptModel
        fields = "__all__"

    def validate(self, data):
        outlay_data = data.get("outlay")

        if outlay_data == 0:
            raise serializers.ValidationError(
                detail={"error": "지출은 0원일 수 없습니다"},
            )

        content_data = data.get("content")
        desc_data = data.get("desc")

        if content_data:
            if "<" in content_data:
                content_data = content_data.replace("<", "&lt;")
                if ">" in content_data:
                    data["content"] = content_data.replace(">", "&gt;")

        if desc_data:
            if "<" in desc_data:
                desc_data = desc_data.replace("<", "&lt;")
                if ">" in desc_data:
                    data["desc"] = desc_data.replace(">", "&gt;")

        return data

    def create(self, validated_data):
        receipt = ReceiptModel(**validated_data)
        receipt.save()
        return receipt

    def update(self, instance, validated_data):
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class PermalinkSerializer(serializers.ModelSerializer):
    class Meta:
        model = PermalinkModel
        fields = "__all__"

    def create(self, validated_data):

        permalink = PermalinkModel(**validated_data)
        permalink.save()
        return permalink
