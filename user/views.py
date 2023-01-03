from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions, status

from .models import User as UserModel
from .serializers import UserSerializer


class UserView(APIView):
    """
    회원 가입
    """
    ermission_classes = [permissions.AllowAny]

    def post(self, request):
        user_serializer = UserSerializer(data=request.data)
        if user_serializer.is_valid(raise_exception=True):
            user_serializer.save()
            return Response({"message": "회원가입 완료"}, status=status.HTTP_200_OK)
                
        return Response(user_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
