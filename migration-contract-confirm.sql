-- Adds a "confirmed_at" timestamp to the documents table, used only by
-- contract documents (owner_type='contract'): set once the partner clicks
-- "Confirm" on their uploaded contract. NULL means not yet confirmed.
-- Replacing a contract (admin re-upload) deletes the old documents row and
-- inserts a fresh one, so confirmed_at naturally resets to NULL on re-upload
-- with no extra logic needed. Run this once in Cloudflare D1 -> this
-- database (partner-portal-mozio-db) -> Console (select all, then Run).
-- Safe to run on a database that already has documents in it.

ALTER TABLE documents ADD COLUMN confirmed_at TEXT;
