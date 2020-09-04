# Don't upgrade nfcore/base, it creates "Kernel too old" error for singularity (because of the debian image)
FROM nfcore/base:1.7
LABEL author="artur.manukyan@umassmed.edu" description="Docker image containing all requirements for the dolphinnext/kb pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
# Install dolphin-tools
RUN git clone https://github.com/dolphinnext/tools /usr/local/bin/dolphin-tools
RUN mkdir -p /project /nl /mnt /share
ENV PATH /opt/conda/envs/dolphinnext-kb-1.0/bin:/usr/local/bin/dolphin-tools/:$PATH
RUN pip3 install kb-python==0.24.4
