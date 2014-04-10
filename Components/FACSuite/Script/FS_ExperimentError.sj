//USEUNIT BD_FrameworkErrorIncludes
//USEUNIT FS_ExperimentMessages

var FSExperimentError = BaseError.extend({
    Name: 'FSExperimentError',
    Message: FSExperimentMessages.ExperimentError
});

var FSExperimentObjectNotFoundError = FSExperimentError.extend({
    Name: 'FSExperimentObjectNotFoundError',
    Message: FSExperimentMessages.FSExperimentObjectNotFoundError
});

