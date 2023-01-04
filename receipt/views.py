from datetime import datetime

from django.utils.dateformat import DateFormat
from django.http import Http404
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from user.models import User
from .models import Receipt

from .serializers import PermalinkSerializer, ReceiptSerializer


class ReceiptListView(APIView):

    # 내가 작성한 내역을 가져온다.
    def get(self, request, **kwargs):
        user = User.objects.get(id=request.user.id)
        receipts = user.receipt_set.all().order_by("date")
        receipt_serializer = ReceiptSerializer(receipts, many=True).data
        return Response(receipt_serializer, status=status.HTTP_200_OK)

    # 새로운 지출 내역을 작성한다.
    def post(self, request):
        data = request.data.copy()
        data["user"] = request.user.id
        receipt_serializer = ReceiptSerializer(data=data)

        if receipt_serializer.is_valid(raise_exception=True):
            receipt_serializer.save()
            return Response({"message": "저장 완료"}, status=status.HTTP_200_OK)

        return Response(receipt_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ReceiptDetailView(APIView):

    def get_object(self, receipt_id):
        try:
            return Receipt.objects.get(id=receipt_id)
        except Receipt.DoesNotExist:
            raise Http404

    # 특정 지출의 상세 내역을 확인한다.
    def get(self, request, receipt_id):
        user = request.user.id
        receipt =  self.get_object(receipt_id)

        if user == receipt.user.id:
            receipt_serializer = ReceiptSerializer(receipt).data
            return Response(receipt_serializer, status=status.HTTP_200_OK)

        return Response({"error": "열람 권한이 없습니다"}, status=status.HTTP_401_UNAUTHORIZED)


    # 특정 지출의 내용을 복사하여 새로운 지출 내역을 작성한다.
    def post(self, request, receipt_id):
        return Response({"message": "post method!!"}, status=status.HTTP_200_OK)

    # 특정 지출의 내용을 수정한다.
    def put(self, request, receipt_id):
        return Response({"message": "put method!!"}, status=status.HTTP_200_OK)

    # 특정 지출의 내용을 삭제한다.
    def delete(self, request, pk):
        return Response({"message": "delete method!!"}, status=status.HTTP_200_OK)
