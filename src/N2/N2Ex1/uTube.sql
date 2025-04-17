CREATE DATABASE utube;
USE utube;


-- USER TABLE
CREATE TABLE IF NOT EXISTS `uTube`.`users` (
  `user_email` VARCHAR(45) NOT NULL COMMENT 'user\'s email is the primary key and should be unique',
  `user_password` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `user_birthdate` DATE NULL,
  `user_gender` ENUM('M', 'F', 'Other') NULL,
  `user_country` VARCHAR(45) NULL,
  `user_cp` VARCHAR(45) NULL,
  `user_creation_date` DATE NOT NULL DEFAULT (CURRENT_DATE),
  PRIMARY KEY (`user_email`),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC) VISIBLE,
  INDEX `user_name` (`user_name` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '1 user -> X channels \n1 user -> X subscription channels\n1 user -> 1 like <- 1 video\n1 user -> 1 dislike <- 1 video\n1 user -> '

-- PLAYLISTS TABLE
CREATE TABLE IF NOT EXISTS `uTube`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `playlist_name` VARCHAR(45) NULL,
  `playlist_date` DATE NULL DEFAULT (CURRENT_DATE),
  `playlist_status` ENUM('Public', 'Private') NOT NULL,
  `users_user_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `fk_playlist_users_idx` (`users_user_email` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_users`
    FOREIGN KEY (`users_user_email`)
    REFERENCES `uTube`.`users` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '1 playlist -> 1 user\n1 playlist -> x videos'

--VIDEOS TABLE
CREATE TABLE IF NOT EXISTS `uTube`.`videos` (
  `video_id` INT NOT NULL AUTO_INCREMENT,
  `video_title` VARCHAR(45) NOT NULL,
  `video_description` VARCHAR(155) NULL,
  `video_size` BIGINT NULL,
  `video_filename` VARCHAR(45) NULL,
  `video_length` INT NULL,
  `video_thumbnail` MEDIUMBLOB NULL,
   `video_status` ENUM('Public', 'Private', 'Hidden') NOT NULL default 'Hidden',
  `video_creation_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `video_last_modification` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'A AJOUTER\nON UPDATE : CURRENT_TIMESTAMP',
  `users_user_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `fk_videos_users1_idx` (`users_user_email` ASC) VISIBLE,
  INDEX `fk_videos_users2_idx` (`video_filename` ASC) INVISIBLE,
  CONSTRAINT `fk_videos_users1`
    FOREIGN KEY (`users_user_email`)
    REFERENCES `uTube`.`users` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = '1 video -> x likes and dislikes : which user + datetime'

-- COMMENTS TABLE
CREATE TABLE IF NOT EXISTS `uTube`.`comments` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `comment_text` VARCHAR(250) NULL,
  `comment_date_creation` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `users_user_email` VARCHAR(45) NOT NULL,
  `videos_video_id` INT NOT NULL,
  PRIMARY KEY (`comment_id`, `videos_video_id`),
  INDEX `fk_comments_users1_idx` (`users_user_email` ASC) VISIBLE,
  INDEX `fk_comments_videos1_idx` (`videos_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_user_email`)
    REFERENCES `uTube`.`users` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_videos1`
    FOREIGN KEY (`videos_video_id`)
    REFERENCES `uTube`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '1 user -> X comments <- 1 video\n'

-- COMMENTS_LIKE TABLE
CREATE TABLE IF NOT EXISTS `uTube`.`comments_like` (
  `comments_like_id` INT NOT NULL,
	`comments_like_status` ENUM('Like', 'Dislike') NOT NULL,
  `users_user_email` VARCHAR(45) NOT NULL,
  `comments_comment_id` INT NOT NULL,
  `comments_videos_video_id` INT NOT NULL,
  PRIMARY KEY (`comments_like_id`),
  INDEX `fk_comments_like_users1_idx` (`users_user_email` ASC) VISIBLE,
  INDEX `fk_comments_like_comments1_idx` (`comments_comment_id` ASC, `comments_videos_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_like_users1`
    FOREIGN KEY (`users_user_email`)
    REFERENCES `uTube`.`users` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_like_comments1`
    FOREIGN KEY (`comments_comment_id` , `comments_videos_video_id`)
    REFERENCES `uTube`.`comments` (`comment_id` , `videos_video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB

--VIDEOS_LIKE TABLE
CREATE TABLE IF NOT EXISTS `uTube`.`videos_likes` (
  `videos_likes_id` INT NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(45) NOT NULL,
  `video_id` INT NOT NULL,
  `videos_likes_status` ENUM('Like', 'Dislike') NOT NULL,
  `users_user_email` VARCHAR(45) NOT NULL,
  `videos_video_id` INT NOT NULL,
  INDEX `fk_videos_likes_users1_idx` (`users_user_email` ASC) VISIBLE,
  INDEX `fk_videos_likes_videos1_idx` (`videos_video_id` ASC) VISIBLE,
  PRIMARY KEY (`videos_likes_id`),
  CONSTRAINT `fk_videos_likes_users1`
    FOREIGN KEY (`users_user_email`)
    REFERENCES `uTube`.`users` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_likes_videos1`
    FOREIGN KEY (`videos_video_id`)
    REFERENCES `uTube`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = 'this table holds likes and dislikes'

-- TAGS TABLE
CREATE TABLE IF NOT EXISTS `uTube`.`tags` (
  `tag_id` INT NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(45) NULL,
  PRIMARY KEY (`tag_id`),
  INDEX `tag_name` (`tag_name`) VISIBLE)
ENGINE = InnoDB

-- VIDEOS_HAS_TAGS TABLE
CREATE TABLE IF NOT EXISTS `uTube`.`videos_has_tags` (
  `videos_video_id` INT NOT NULL,
  `tags_tag_id` INT NOT NULL,
  PRIMARY KEY (`videos_video_id`, `tags_tag_id`),
  INDEX `fk_videos_has_tags_tags1_idx` (`tags_tag_id` ASC) VISIBLE,
  INDEX `fk_videos_has_tags_videos1_idx` (`videos_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_has_tags_videos1`
    FOREIGN KEY (`videos_video_id`)
    REFERENCES `uTube`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_has_tags_tags1`
    FOREIGN KEY (`tags_tag_id`)
    REFERENCES `uTube`.`tags` (`tag_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4

-- CHANNELS TABLE
CREATE TABLE IF NOT EXISTS `uTube`.`channels` (
  `channel_id` INT NOT NULL AUTO_INCREMENT,
  `channel_name` VARCHAR(45) NOT NULL,
  `channel_description` VARCHAR(155) NULL,
  `channel_creation_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `users_user_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`channel_id`),
  INDEX `fk_channels_users1_idx` (`users_user_email` ASC) VISIBLE,
  CONSTRAINT `fk_channels_users1`
    FOREIGN KEY (`users_user_email`)
    REFERENCES `uTube`.`users` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB

-- CHANNEL SUBSCRIPTIONS
CREATE TABLE IF NOT EXISTS `uTube`.`user_suscriptions_channels` (
  `user_suscriptions_channels_id` VARCHAR(45) NULL ,
  `users_user_email` VARCHAR(45) NOT NULL,
  `channels_channel_id` INT NOT NULL,
  INDEX `fk_user_suscriptions_channels_users1_idx` (`users_user_email` ASC) VISIBLE,
  INDEX `fk_user_suscriptions_channels_channels1_idx` (`channels_channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_suscriptions_channels_users1`
    FOREIGN KEY (`users_user_email`)
    REFERENCES `uTube`.`users` (`user_email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_suscriptions_channels_channels1`
    FOREIGN KEY (`channels_channel_id`)
    REFERENCES `uTube`.`channels` (`channel_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB