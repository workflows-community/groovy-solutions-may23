
process counter{

   debug true

   input:
   path samplefile

   shell:
   '''
   wc -l !{samplefile}
   '''
}

workflow {
  samplefile_channel = Channel.fromPath( 'files/*.txt' )
  samplefile_channel | counter 
}
