"""add users, appls

Revision ID: 41d3ad06d7dd
Revises: bbcf41bc9532
Create Date: 2023-10-05 18:03:51.443336

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '41d3ad06d7dd'
down_revision: Union[str, None] = 'bbcf41bc9532'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('users',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nickname', sa.String(length=255), nullable=False),
    sa.Column('email', sa.String(length=255), nullable=False),
    sa.Column('firstname', sa.String(length=255), nullable=True),
    sa.Column('lastname', sa.String(length=255), nullable=True),
    sa.Column('password', sa.String(length=1024), nullable=False),
    sa.Column('reg_date', sa.DateTime(), nullable=True),
    sa.Column('telegram', sa.String(length=255), nullable=False),
    sa.Column('discord', sa.String(length=255), nullable=False),
    sa.Column('img', sa.String(length=255), nullable=False),
    sa.Column('is_super', sa.Boolean(), nullable=True),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('email'),
    sa.UniqueConstraint('nickname')
    )
    op.create_table('applications',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('text', sa.Text(), nullable=False),
    sa.Column('default_user_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['default_user_id'], ['users.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.alter_column('legends', 'cost',
               existing_type=sa.INTEGER(),
               nullable=False)
    op.alter_column('legends', 'img_main',
               existing_type=sa.VARCHAR(length=255),
               nullable=False)
    op.alter_column('legends', 'img_short',
               existing_type=sa.VARCHAR(length=255),
               nullable=False)
    op.alter_column('legends', 'release_info',
               existing_type=sa.VARCHAR(length=255),
               nullable=False)
    op.drop_column('stats', 'img')
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('stats', sa.Column('img', sa.VARCHAR(length=255), autoincrement=False, nullable=False))
    op.alter_column('legends', 'release_info',
               existing_type=sa.VARCHAR(length=255),
               nullable=True)
    op.alter_column('legends', 'img_short',
               existing_type=sa.VARCHAR(length=255),
               nullable=True)
    op.alter_column('legends', 'img_main',
               existing_type=sa.VARCHAR(length=255),
               nullable=True)
    op.alter_column('legends', 'cost',
               existing_type=sa.INTEGER(),
               nullable=True)
    op.drop_table('applications')
    op.drop_table('users')
    # ### end Alembic commands ###
