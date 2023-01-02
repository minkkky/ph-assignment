from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser


class UserManager(BaseUserManager):
    def create_user(self, email, password=None):
        if not email:
            raise ValueError('Users must have an email')
        user = self.model(
            email=email,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user
    
    # python manage.py createsuperuser 사용 시 해당 함수가 사용됨
    def create_superuser(self, email, password=None):
        user = self.create_user(
            email=email,
            password=password
        )
        user.is_admin = True
        user.save(using=self._db)
        return user


class User(AbstractBaseUser):
    email = models.EmailField("이메일 주소", max_length=100, unique=True)
    password = models.CharField("비밀번호", max_length=128)
    join_date = models.DateTimeField("가입일", auto_now_add=True)
    is_active = models.BooleanField("계정 활성화 여부", default=True) 
    is_admin = models.BooleanField("관리자 권한", default=False)
    
    USERNAME_FIELD = 'email'

    REQUIRED_FIELDS = []
    
    objects = UserManager()
    
    def __str__(self):
        return self.username