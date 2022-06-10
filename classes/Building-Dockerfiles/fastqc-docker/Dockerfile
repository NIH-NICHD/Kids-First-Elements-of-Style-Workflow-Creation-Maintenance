# Full contents of Dockerfile

FROM continuumio/miniconda3
LABEL description="Base docker image with conda and util libraries"
ARG ENV_NAME="fastqc"

# Install the conda environment
COPY environment.yml /
RUN conda env create --quiet --name ${ENV_NAME} --file /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/${ENV_NAME}/bin:$PATH
