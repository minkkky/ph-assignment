from django.contrib import admin

from .models import Permalink, Receipt


class ReceiptAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'content', 'outlay']
    list_display_links = ['content', 'outlay']
    list_filter = ('user',)


admin.site.register(Receipt, ReceiptAdmin)
admin.site.register(Permalink)
