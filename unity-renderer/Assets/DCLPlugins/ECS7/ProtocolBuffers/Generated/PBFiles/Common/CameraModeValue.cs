// <auto-generated>
//     Generated by the protocol buffer compiler.  DO NOT EDIT!
//     source: CameraModeValue.proto
// </auto-generated>
#pragma warning disable 1591, 0612, 3021
#region Designer generated code

using pb = global::Google.Protobuf;
using pbc = global::Google.Protobuf.Collections;
using pbr = global::Google.Protobuf.Reflection;
using scg = global::System.Collections.Generic;
/// <summary>Holder for reflection information generated from CameraModeValue.proto</summary>
public static partial class CameraModeValueReflection {

  #region Descriptor
  /// <summary>File descriptor for CameraModeValue.proto</summary>
  public static pbr::FileDescriptor Descriptor {
    get { return descriptor; }
  }
  private static pbr::FileDescriptor descriptor;

  static CameraModeValueReflection() {
    byte[] descriptorData = global::System.Convert.FromBase64String(
        string.Concat(
          "ChVDYW1lcmFNb2RlVmFsdWUucHJvdG8qNQoPQ2FtZXJhTW9kZVZhbHVlEhAK",
          "DEZJUlNUX1BFUlNPThAAEhAKDFRISVJEX1BFUlNPThABYgZwcm90bzM="));
    descriptor = pbr::FileDescriptor.FromGeneratedCode(descriptorData,
        new pbr::FileDescriptor[] { },
        new pbr::GeneratedClrTypeInfo(new[] {typeof(global::CameraModeValue), }, null, null));
  }
  #endregion

}
#region Enums
public enum CameraModeValue {
  [pbr::OriginalName("FIRST_PERSON")] FirstPerson = 0,
  [pbr::OriginalName("THIRD_PERSON")] ThirdPerson = 1,
}

#endregion


#endregion Designer generated code
