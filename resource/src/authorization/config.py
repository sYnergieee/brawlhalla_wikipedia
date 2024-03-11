from vakt import Guard, RulesChecker, MemoryStorage

from authorization.politicians import politicians

StorageABAC = MemoryStorage()

for policy in politicians:
    StorageABAC.add(policy)

ABACGuard = Guard(StorageABAC, RulesChecker())
