<p align="center"><img src="https://i.ibb.co/HdSbwGZ/logo.png" width="400" alt="Blog Logo"></p>

<p align="center">
<a href="https://ibb.co/qBpBC2M"><img src="https://i.ibb.co/99j4qgv/main-page.png" alt="Main page"></a>
<a href="https://ibb.co/CQ37HRX"><img src="https://i.ibb.co/gMP9nQb/single-page.png" alt="Post page"></a>
<a href="https://ibb.co/RCHP6sM"><img src="https://i.ibb.co/CJct444/personal.png" alt="Personal cabinet"></a>
<a href="https://ibb.co/GC0RzKr"><img src="https://i.ibb.co/bXGS8Hj/dashboard.png" alt="Dashboard"></a>
<a href="https://ibb.co/d42Jt0H"><img src="https://i.ibb.co/G5LLXpF/users.png" alt="Index"></a>
<a href="https://ibb.co/MGbn2m8"><img src="https://i.ibb.co/4Yvy7Ly/post-show.png" alt="Show"></a>
<a href="https://ibb.co/3CcqN0B"><img src="https://i.ibb.co/5BCG5C1/post-create.png" alt="Create"></a>
<a href="https://ibb.co/mcdQgmc"><img src="https://i.ibb.co/1rshrp4/post-edit.png" alt="Edit"></a>
</p>

# Blog
This project is a blog implemented using the Laravel framework. It provides the ability to create, edit, and interact with articles and users. Additionally, it includes functionality for likes, an administrative panel, categories, posts, and tags.

## Features
- User Authentication and Authorization: Users can create accounts and log in.

- Administrative Panel: Administrators have access to a special administrative panel to manage articles, users, categories, and other site settings.

- Creating, Editing, and Deleting Articles: Users can create new articles, edit, and delete existing ones.

- Likes: Users can like articles, expressing their appreciation.

- Top Articles by Likes on Homepage: The homepage displays a list of the most popular articles by the number of likes.

- Related Articles Block: Under each article on the viewing page, there is a block showing similar articles based on certain criteria.

## <b>Installation and Setup</b>
1. Clone the Repository: Clone this repository to your local machine using the command:

```bash
git clone https://github.com/DenMitter/blog-laravel.git
```

1. Install Dependencies: Run the composer install command to install the necessary packages.
```bash
composer install
```

1. Configure Environment: Copy the .env.example file to .env and configure the database access parameters.
```bash
cp .env.example .env
php artisan key:generate
```

1. Run Migrations and seeders: Execute the php artisan migrate command to run migrations and create tables in the database.
```bash
php artisan migrate
```

1. Run the Local Server: Run the php artisan serve command to start the local server.
```bash
php artisan serve
```

1. Run jobs:
```
php artisan queue:work
```

1. Access the System: Open a web browser and go to http://localhost:8000 to access the blog's homepage.

<p>
    <div align="center">
        <h3>Technologies used</h3>
        <img src="https://img.shields.io/badge/-HTML-c58545?style=for-the-badge&logo=html5&logoColor=c58545&labelColor=282828">
        <img src="https://img.shields.io/badge/-Bootstrap-9754ed?style=for-the-badge&logo=bootstrap&logoColor=9754ed&labelColor=282828">
        <img src="https://img.shields.io/badge/-PHP-609ad3?style=for-the-badge&logo=php&logoColor=609ad3&labelColor=282828">
        <img src="https://img.shields.io/badge/-Laravel-df5065?style=for-the-badge&logo=laravel&logoColor=df5065&labelColor=282828">
    </div>
</p>
