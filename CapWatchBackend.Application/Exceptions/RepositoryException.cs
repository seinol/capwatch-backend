using System;
using System.Runtime.Serialization;

namespace CapWatchBackend.Application.Exceptions {
  [Serializable]
  public class RepositoryException : BaseException {
    public RepositoryException(string message, Exception innerException) : base(message, innerException) { }

    protected RepositoryException(SerializationInfo info, StreamingContext context) : base(info, context) { }
  }
}
