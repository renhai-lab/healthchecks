#!/usr/bin/env bash
# Exit on error
set -o errexit

# Modify this line as needed for your package manager (pip, poetry, etc.)
pip install -r requirements.txt

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate

python manage.py compress
# 第一次运行： 创建超级用户
# echo "Creating superuser..."
# python manage.py shell <<EOF
# from django.contrib.auth import get_user_model
# User = get_user_model()
# if not User.objects.filter(username='${DJANGO_SUPERUSER_USERNAME}').exists():
#     User.objects.create_superuser('${DJANGO_SUPERUSER_USERNAME}', '${DJANGO_SUPERUSER_EMAIL}', '${DJANGO_SUPERUSER_PASSWORD}')
#     print("Superuser created")
# else:
#     print("Superuser already exists")
# EOF
# if [ $? -ne 0 ]; then
#     echo "Failed to create superuser" >&2
#     exit 1
# fi