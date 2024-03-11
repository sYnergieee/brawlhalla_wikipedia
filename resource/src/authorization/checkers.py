from abc import ABC, abstractmethod
from vakt import Inquiry

from authorization.config import ABACGuard
from authorization.schemas import *
from authorization.constants import *


class BaseCheckerAuthService(ABC):
    @abstractmethod
    def check(self, action: ActionData, resource: ResourceData, subject: SubjectData):
        raise NotImplementedError()

    def _build_inq_and_execute(self, action, resource, subject):
        inq = Inquiry(action=action, resource=resource, subject=subject)
        return StatusAccess.allow if ABACGuard.is_allowed(inq) else StatusAccess.denied


class RoleCheckerAuthService(BaseCheckerAuthService):
    def check(self, action: ActionData, resource: ResourceData, subject: SubjectData):
        subject_to_inq = {"role": subject.role_id}
        return self._build_inq_and_execute(action.name, resource.name, subject_to_inq)


class RoleOwnerCheckerAuthService(BaseCheckerAuthService):
    def check(self, action: ActionData, resource: ResourceData, subject: SubjectData):
        subject_to_inq = {
            "role": subject.role_id,
            "is_owner": subject.id == subject.owner_id,
        }
        return self._build_inq_and_execute(action.name, resource.name, subject_to_inq)
