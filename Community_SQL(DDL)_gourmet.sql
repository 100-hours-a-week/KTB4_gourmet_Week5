```sql
CREATE TABLE `users` (
    `user_id` BIGINT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `nickname` VARCHAR(50) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NULL DEFAULT NULL
        ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL DEFAULT NULL,
    `profile_image` VARCHAR(500) NULL,

    CONSTRAINT `pk_users`
        PRIMARY KEY (`user_id`),

    CONSTRAINT `uq_users_email`
        UNIQUE (`email`),

    CONSTRAINT `uq_users_nickname`
        UNIQUE (`nickname`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;


CREATE TABLE `posts` (
    `post_id` BIGINT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `content` TEXT NOT NULL,
    `view_count` INT NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NULL DEFAULT NULL
        ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL DEFAULT NULL,
    `user_id` BIGINT NOT NULL,

    CONSTRAINT `pk_posts`
        PRIMARY KEY (`post_id`),

    CONSTRAINT `fk_posts_user`
        FOREIGN KEY (`user_id`)
        REFERENCES `users` (`user_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;


CREATE TABLE `comments` (
    `comment_id` BIGINT NOT NULL AUTO_INCREMENT,
    `content` VARCHAR(500) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NULL DEFAULT NULL
        ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL DEFAULT NULL,
    `user_id` BIGINT NOT NULL,
    `post_id` BIGINT NOT NULL,

    CONSTRAINT `pk_comments`
        PRIMARY KEY (`comment_id`),

    CONSTRAINT `fk_comments_user`
        FOREIGN KEY (`user_id`)
        REFERENCES `users` (`user_id`),

    CONSTRAINT `fk_comments_post`
        FOREIGN KEY (`post_id`)
        REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;


CREATE TABLE `image` (
    `image_id` BIGINT NOT NULL AUTO_INCREMENT,
    `image_url` VARCHAR(500) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NULL DEFAULT NULL
        ON UPDATE CURRENT_TIMESTAMP,
    `deleted_at` DATETIME NULL DEFAULT NULL,
    `post_id` BIGINT NOT NULL,

    CONSTRAINT `pk_image`
        PRIMARY KEY (`image_id`),

    CONSTRAINT `fk_image_post`
        FOREIGN KEY (`post_id`)
        REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;


CREATE TABLE `post_likes` (
    `post_like_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `user_id` BIGINT NOT NULL,
    `post_id` BIGINT NOT NULL,

    CONSTRAINT `pk_post_likes`
        PRIMARY KEY (`post_like_id`),

    CONSTRAINT `uq_post_likes_user_post`
        UNIQUE (`user_id`, `post_id`),

    CONSTRAINT `fk_post_likes_user`
        FOREIGN KEY (`user_id`)
        REFERENCES `users` (`user_id`),

    CONSTRAINT `fk_post_likes_post`
        FOREIGN KEY (`post_id`)
        REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;
```
