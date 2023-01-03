from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from user.models import User as UserModel


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserModel
        fields = ["email"]

    def create(self, validated_data):
        password = validated_data.pop("password", None)
        user = UserModel(**validated_data)
        user.set_password(password)
        user.save()
        return user
