"""delete legend_skins

Revision ID: 99155116a633
Revises: 5f8059373ce9
Create Date: 2023-10-13 19:13:02.070803

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '99155116a633'
down_revision: Union[str, None] = '5f8059373ce9'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('legend_skins')
    op.add_column('skins', sa.Column('legend_id', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'skins', 'legends', ['legend_id'], ['id'])
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'skins', type_='foreignkey')
    op.drop_column('skins', 'legend_id')
    op.create_table('legend_skins',
    sa.Column('legend_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.Column('skin_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.ForeignKeyConstraint(['legend_id'], ['legends.id'], name='legend_skins_legend_id_fkey'),
    sa.ForeignKeyConstraint(['skin_id'], ['skins.id'], name='legend_skins_skin_id_fkey'),
    sa.PrimaryKeyConstraint('legend_id', 'skin_id', name='legend_skins_pkey')
    )
    # ### end Alembic commands ###