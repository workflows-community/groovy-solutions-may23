
params.samplefile = null

def errorMessage() {
    log.info"""
    ========================
    This is an error message
    ========================
    You failed to provide the --samplefile input parameter
    Please provide this parameter as follows:
      --samplefile /full/path/to/sample/file
    The pipeline has exited with error status 1.
    """.stripIndent()
    exit 1
}

workflow {
  samplefile_channel = params.samplefile != null ? Channel.fromPath(params.samplefile) : errorMessage()
  samplefile_channel | view
}
