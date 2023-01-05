from datetime import timedelta

from django.http import Http404
from django.utils import timezone
from rest_framework import permissions, status
from rest_framework.response import Response
from rest_framework.views import APIView

from user.models import User

from .models import Permalink, Receipt
from .serializers import PermalinkSerializer, ReceiptSerializer


class ReceiptListView(APIView):

    # 내가 작성한 내역을 가져온다.
    def get(self, request, **kwargs):
        user = User.objects.get(id=request.user.id)
        receipts = user.receipt_set.all().order_by("-date")
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
        receipt = self.get_object(receipt_id)

        if user == receipt.user.id:
            receipt_serializer = ReceiptSerializer(receipt).data
            return Response(receipt_serializer, status=status.HTTP_200_OK)

        return Response({"error": "열람 권한이 없습니다"}, status=status.HTTP_401_UNAUTHORIZED)

    # 특정 지출의 내용을 복사하여 새로운 지출 내역을 작성한다.
    def post(self, request, receipt_id):
        user = request.user.id
        receipt = self.get_object(receipt_id)
        now = timezone.now()
        data = {
            "user": user,
            "date": now,
            "content": receipt.content,
            "outlay": receipt.outlay,
            "desc": receipt.desc,
        }
        receipt_serializer = ReceiptSerializer(data=data)

        if user == receipt.user.id:

            if receipt_serializer.is_valid(raise_exception=True):
                receipt_serializer.save()
                return Response({"message": "저장 완료"}, status=status.HTTP_200_OK)
            return Response(
                receipt_serializer.errors, status=status.HTTP_400_BAD_REQUEST
            )

        return Response({"error": "복제 권한이 없습니다"}, status=status.HTTP_401_UNAUTHORIZED)

    # 특정 지출의 내용을 수정한다.
    def put(self, request, receipt_id):
        user = request.user.id
        receipt = self.get_object(receipt_id)

        if user == receipt.user.id:
            receipt_serializer = ReceiptSerializer(
                receipt, data=request.data, partial=True
            )

            if receipt_serializer.is_valid():
                receipt_serializer.save()
                return Response(receipt_serializer.data, status=status.HTTP_200_OK)

            return Response(
                receipt_serializer.errors, status=status.HTTP_400_BAD_REQUEST
            )

        return Response({"error": "권한이 없습니다."}, status=status.HTTP_401_UNAUTHORIZED)

    # 특정 지출의 내용을 삭제한다.
    def delete(self, request, receipt_id):
        user = request.user.id
        receipt = self.get_object(receipt_id)

        if user == receipt.user.id:
            receipt.delete()
            return Response({"message": "삭제 완료!"}, status=status.HTTP_200_OK)

        return Response(
            {"error": "이 글을 작성한 사람이 아닙니다!"}, status=status.HTTP_400_BAD_REQUEST
        )


class PermalinkView(APIView):
    permission_classes = [permissions.AllowAny]

    # 공유된 지출 내역을 조회한다.
    def get(self, request, permalink_id):

        try:
            perma = Permalink.objects.get(id=permalink_id)
        except Permalink.DoesNotExist:
            raise Http404

        # 유효기간 체크
        if perma.end_date > timezone.now():
            receipt = Receipt.objects.get(id=perma.refer_to.id)
            receipt_serializer = ReceiptSerializer(receipt).data
            return Response(receipt_serializer, status=status.HTTP_200_OK)
        return Response({"error": "유효기간이 지난 링크입니다"}, status=status.HTTP_400_BAD_REQUEST)


class PermalinkAdminView(APIView):

    # 특정 지출 내역을 공유한다.
    def post(self, request, receipt_id):
        user = request.user.id
        receipt = Receipt.objects.get(id=receipt_id)

        if user == receipt.user.id:
            end_date = timezone.now() + timedelta(minutes=3)
            request.data["refer_to"] = receipt_id
            request.data["end_date"] = end_date
            perma_serializer = PermalinkSerializer(data=request.data)

            if perma_serializer.is_valid(raise_exception=True):
                permalink = perma_serializer.save()
                url = f"http://127.0.0.1:8000/receipts/shared/{permalink.id}"
                return Response(
                    {"message": "저장 완료", "url": url}, status=status.HTTP_200_OK
                )
            return Response(perma_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        return Response({"message": "post method!!"}, status=status.HTTP_200_OK)

    # 공유 내역을 삭제한다.
    def delete(self, request, permalink_id):
        user = request.user.id
        perma = Permalink.objects.get(id=permalink_id)
        receipt = Receipt.objects.get(id=perma.refer_to)

        if user == receipt.user.id:
            perma.delete()
            return Response({"message": "삭제 완료!"}, status=status.HTTP_200_OK)

        return Response(
            {"error": "이 글을 작성한 사람이 아닙니다!"}, status=status.HTTP_400_BAD_REQUEST
        )
