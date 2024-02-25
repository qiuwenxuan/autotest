import abc

class Connection():
    metaclass=abc.ABCMeta

    @abc.abstractmethod
    def Connect(self):
        pass

    @abc.abstractmethod
    def Write(self, cmd):
        pass

    @abc.abstractmethod
    def Read(self):
        pass

    @abc.abstractmethod
    def Send(self, cmd, endStr, timeOut):
        pass

    @abc.abstractmethod
    def DisConnect(self):
        pass
