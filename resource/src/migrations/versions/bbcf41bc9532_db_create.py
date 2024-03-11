"""db create

Revision ID: bbcf41bc9532
Revises: 
Create Date: 2023-09-02 21:19:02.747104

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'bbcf41bc9532'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('chests',
                    sa.Column('id', sa.Integer(), nullable=False),
                    sa.Column('name', sa.String(length=255), nullable=False),
                    sa.Column('img', sa.String(length=255), nullable=False),
                    sa.Column('cost', sa.Integer(), nullable=False),
                    sa.PrimaryKeyConstraint('id')
                    )
    op.create_table('events',
                    sa.Column('id', sa.Integer(), nullable=False),
                    sa.Column('name', sa.String(length=255), nullable=False),
                    sa.PrimaryKeyConstraint('id')
                    )
    op.create_table('legends',
                    sa.Column('id', sa.Integer(), nullable=False),
                    sa.Column('name', sa.String(length=255), nullable=False),
                    sa.Column('aka_name', sa.String(
                        length=255), nullable=False),
                    sa.Column('description', sa.Text(), nullable=False),
                    sa.Column('cost', sa.Integer(), nullable=False),
                    sa.Column('img_main', sa.String(
                        length=255), nullable=False),
                    sa.Column('img_short', sa.String(
                        length=255), nullable=False),
                    sa.Column('release_info', sa.String(
                        length=255), nullable=False),
                    sa.PrimaryKeyConstraint('id')
                    )
    op.create_table('skins',
                    sa.Column('id', sa.Integer(), nullable=False),
                    sa.Column('name', sa.String(length=255), nullable=False),
                    sa.Column('img', sa.String(length=255), nullable=False),
                    sa.Column('is_crossover', sa.Boolean(), nullable=False),
                    sa.Column('is_exclusive', sa.Boolean(), nullable=False),
                    sa.Column('cost', sa.Integer(), nullable=True),
                    sa.Column('purshase_info', sa.ARRAY(
                        sa.String()), nullable=True),
                    sa.PrimaryKeyConstraint('id')
                    )
    op.create_table('stat_imgs',
                    sa.Column('value', sa.Integer(), nullable=False),
                    sa.Column('img', sa.String(length=255), nullable=False),
                    sa.PrimaryKeyConstraint('value')
                    )
    op.create_table('stats',
                    sa.Column('id', sa.Integer(), nullable=False),
                    sa.Column('name', sa.String(length=255), nullable=False),
                    sa.Column('img', sa.String(length=255), nullable=False),
                    sa.PrimaryKeyConstraint('id')
                    )
    op.create_table('weapons',
                    sa.Column('id', sa.Integer(), nullable=False),
                    sa.Column('name', sa.String(length=255), nullable=False),
                    sa.Column('img', sa.String(length=255), nullable=False),
                    sa.PrimaryKeyConstraint('id')
                    )
    op.create_table('chest_skins',
                    sa.Column('chest_id', sa.Integer(), nullable=False),
                    sa.Column('skin_id', sa.Integer(), nullable=False),
                    sa.ForeignKeyConstraint(['chest_id'], ['chests.id'], ),
                    sa.ForeignKeyConstraint(['skin_id'], ['skins.id'], ),
                    sa.PrimaryKeyConstraint('chest_id', 'skin_id')
                    )
    op.create_table('event_skins',
                    sa.Column('event_id', sa.Integer(), nullable=False),
                    sa.Column('skin_id', sa.Integer(), nullable=False),
                    sa.ForeignKeyConstraint(['event_id'], ['events.id'], ),
                    sa.ForeignKeyConstraint(['skin_id'], ['skins.id'], ),
                    sa.PrimaryKeyConstraint('event_id', 'skin_id')
                    )
    op.create_table('legend_skins',
                    sa.Column('legend_id', sa.Integer(), nullable=False),
                    sa.Column('skin_id', sa.Integer(), nullable=False),
                    sa.ForeignKeyConstraint(['legend_id'], ['legends.id'], ),
                    sa.ForeignKeyConstraint(['skin_id'], ['skins.id'], ),
                    sa.PrimaryKeyConstraint('legend_id', 'skin_id')
                    )
    op.create_table('legend_stats',
                    sa.Column('stat_id', sa.Integer(), nullable=False),
                    sa.Column('legend_id', sa.Integer(), nullable=False),
                    sa.Column('value', sa.Integer(), nullable=True),
                    sa.ForeignKeyConstraint(['legend_id'], ['legends.id'], ),
                    sa.ForeignKeyConstraint(['stat_id'], ['stats.id'], ),
                    sa.ForeignKeyConstraint(['value'], ['stat_imgs.value'], ),
                    sa.PrimaryKeyConstraint('stat_id', 'legend_id')
                    )
    op.create_table('weapon_legends',
                    sa.Column('weapon_id', sa.Integer(), nullable=False),
                    sa.Column('legend_id', sa.Integer(), nullable=False),
                    sa.Column('img', sa.String(length=255), nullable=True),
                    sa.Column('name', sa.String(length=255), nullable=True),
                    sa.ForeignKeyConstraint(['legend_id'], ['legends.id'], ),
                    sa.ForeignKeyConstraint(['weapon_id'], ['weapons.id'], ),
                    sa.PrimaryKeyConstraint('weapon_id', 'legend_id')
                    )
    op.create_table('weapon_skins',
                    sa.Column('weapon_id', sa.Integer(), nullable=False),
                    sa.Column('skin_id', sa.Integer(), nullable=False),
                    sa.Column('img', sa.String(length=255), nullable=False),
                    sa.Column('name', sa.String(length=255), nullable=False),
                    sa.ForeignKeyConstraint(['skin_id'], ['skins.id'], ),
                    sa.ForeignKeyConstraint(['weapon_id'], ['weapons.id'], ),
                    sa.PrimaryKeyConstraint('weapon_id', 'skin_id')
                    )
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('weapon_skins')
    op.drop_table('weapon_legends')
    op.drop_table('legend_stats')
    op.drop_table('legend_skins')
    op.drop_table('event_skins')
    op.drop_table('chest_skins')
    op.drop_table('weapons')
    op.drop_table('stats')
    op.drop_table('stat_imgs')
    op.drop_table('skins')
    op.drop_table('legends')
    op.drop_table('events')
    op.drop_table('chests')
    # ### end Alembic commands ###