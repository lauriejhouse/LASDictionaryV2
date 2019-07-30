// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: google/Protobuf/duration.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
#import <protobuf/Duration.pbobjc.h>
#else
 #import "google/Protobuf/Duration.pbobjc.h"
#endif
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - GPBDurationRoot

@implementation GPBDurationRoot

// No extensions in the file and no imports, so no need to generate
// +extensionRegistry.

@end

#pragma mark - GPBDurationRoot_FileDescriptor

static GPBFileDescriptor *GPBDurationRoot_FileDescriptor(void) {
  // This is called by +initialize so there is no need to worry
  // about thread safety of the singleton.
  static GPBFileDescriptor *descriptor = NULL;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    descriptor = [[GPBFileDescriptor alloc] initWithPackage:@"google.Protobuf"
                                                 objcPrefix:@"GPB"
                                                     syntax:GPBFileSyntaxProto3];
  }
  return descriptor;
}

#pragma mark - GPBDuration

@implementation GPBDuration

@dynamic seconds;
@dynamic nanos;

typedef struct GPBDuration__storage_ {
  uint32_t _has_storage_[1];
  int32_t nanos;
  int64_t seconds;
} GPBDuration__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "seconds",
        .dataTypeSpecific.className = NULL,
        .number = GPBDuration_FieldNumber_Seconds,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(GPBDuration__storage_, seconds),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "nanos",
        .dataTypeSpecific.className = NULL,
        .number = GPBDuration_FieldNumber_Nanos,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(GPBDuration__storage_, nanos),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeInt32,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:[GPBDuration class]
                                     rootClass:[GPBDurationRoot class]
                                          file:GPBDurationRoot_FileDescriptor()
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(GPBDuration__storage_)
                                         flags:GPBDescriptorInitializationFlag_None];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end


#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
