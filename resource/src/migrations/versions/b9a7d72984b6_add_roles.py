"""add roles

Revision ID: b9a7d72984b6
Revises: 41d3ad06d7dd
Create Date: 2023-10-05 18:29:58.269081

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'b9a7d72984b6'
down_revision: Union[str, None] = '41d3ad06d7dd'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('roles',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=255), nullable=False),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('name')
    )
    op.drop_column('users', 'is_super')
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('users', sa.Column('is_super', sa.BOOLEAN(), autoincrement=False, nullable=True))
    op.drop_table('roles')
    # ### end Alembic commands ###
