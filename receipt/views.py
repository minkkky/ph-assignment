from rest_framework import permissions, status
from rest_framework.response import Response
from rest_framework.views import APIView

from .serializers import PermalinkSerializer, ReceiptSerializer


class ReceiptListView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        return Response({"message": "get method!!"}, status=status.HTTP_200_OK)

    def post(self, request):
        return Response({"message": "post method!!"}, status=status.HTTP_200_OK)


class ReceiptDetailView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request):
        return Response({"message": "get method!!"}, status=status.HTTP_200_OK)

    def post(self, request):
        return Response({"message": "post method!!"}, status=status.HTTP_200_OK)

    def put(self, request):
        return Response({"message": "put method!!"}, status=status.HTTP_200_OK)

    def delete(self, request):
        return Response({"message": "delete method!!"}, status=status.HTTP_200_OK)
