/**
 * contains arrays of human-readable error messages
 * @author Noel Rice
 * @company Falafel Software
 */

var ErrorMessages = {
    ExcelError: 'Excel requires a valid FileName and SheetName',
    Error: 'BD error detected.',
    BaseError: 'Error detected in framework object "%s"',
    IncorrectType: 'Unexpected type. %s must descend from %s',
    OptionExpectedError: 'Expected option(s) "%s" was not passed to the "%s()" method.',
    InitOptionUnexpectedValue: 'Option %s is "%s" but expected "%s"',
    InvalidClassName: 'ClrFullClassName for %s is "%s" but expected "%s"',
    EventSubscribeError: 'Error calling Event subscribe().',
    EventPublishError: 'Error calling Event publish().',    
    AppUnexpectedPopupError: 'Unexpected popup windows were present. Closing popup windows.',
    AppInitFail: 'Error in App initialization. The TestedApp option is required.',
    AppRunFail: 'Error in App run(). Unable to run process',
    PropertyNotFound: '%s not found',
    InvalidAction: '"%s" has state %s = %s. This state is invalid to perform the %s() method',
    InitInvalidAction: 'Actions must descend from the Action object.',
    InitInvalidStates: 'The Actions ValidStates property must have at least one member.',
    FinderErrorNoProps: 'No property names included in options for find operation',
    FinderErrorNoValues: 'No property values included in options for find operation',
    FinderErrorNoOptions: 'No options were sent to the find operation.',
    MapperMapError: '"%s" not found during map() using options properties: "%s"',
    MapperFindOnPathError: '"%s" not found during findOnPath() at map index %i',
    MapperMissingClassType: 'ClassMap is missing required ClassType for property %s',
    NotImplementedError: 'Method "%s" is not implemented.',
    NoItemsFoundInCollection: 'No items were found in collection %s during method %s',
    MissingParameter: 'Parameter %s not found during method %s',
    EmptyCollection: 'The "%s" collection is empty', 
    PropertyNotAssigned: 'The %s property %s is not assigned in method %s',
    FileNotFound: 'File %s not found',
    UnableToReadXml: 'Unable to read %s. Reason: "%s"',
    CorruptConfigFile: 'The file %s has been altered. The file must be created and edited using the framework %s object.',
    TimedOut: '%s timed out',
    ObjectNotFoundError: '%s not found',
    AttemptToSetReadOnly: 'Attempt to assign object %s in method "%s". "%s" is read-only',
    
     // WORKLIST ERROR MESSAGES
    getThresholdRate: 'method getThresholdRate value is not set.',
    setFlowRateNotSet: 'method setFlowRate value is not set.',
    setFlowRateNoParamPassed: 'method setFlowRate did not pass in param on options',
 
    WlTaskPanelSampleIDNotVisible: 'Worklist, task panel, "SampleID Prefix" text field is not visible',
    WlTaskPanelSampleIDNotEnabled: 'Worklist, task panel, "SampleID Prefix" text field is not enabled',
    WlTaskPanelNumberNotVisible: 'Worklist, task panel, "Number" text field is not visible',
    WlTaskPanelNumberNotEnabled: 'Worklist, task panel, "Number" text field is not enabled'
  
}
