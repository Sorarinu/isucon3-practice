use `isucon`;
CREATE INDEX `memos_idx_is_private_created_at` ON memos (`is_private`,`created_at`);
CREATE INDEX `memos_idx_user_created_at` ON memos (`user`,`created_at`);
CREATE INDEX `memos_idx_user_is_private_created_at` ON memos (`user`,`is_private`,`created_at`);

ALTER TABLE memos ADD COLUMN ( title VARCHAR(255) );
UPDATE memos SET title = substring_index(content,"\n",1);